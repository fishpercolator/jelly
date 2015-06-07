class ReportsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /reports
  # GET /reports.json
  def index
    if report_params[:date]
      @date = Date.parse(report_params[:date])
      @reports = Report.where(:today => @date).order(:created_at)
      render :date_index and return
    elsif report_params[:user]
      @user = User.find(report_params[:user])
      @reports = Report.where(:user_id => @user).order('today desc')
      render :user_index and return
    else
      redirect_to :action => 'by_day' and return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end
  
  # GET /reports/by_day
  def by_day
    authorize! :read, Report
    @days = Report.day_counts
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(report_params[:id])
    np = @report.next_prev
    @next = np[:next]; @prev = np[:prev]

    if report_params[:present]
      render :present, :layout => 'present' and return
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end
  
  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new
    @report.user ||= current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(report_params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params[:report])
    @report.user ||= current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(report_params[:id])
    @report.user ||= current_user

    respond_to do |format|
      if @report.update_attributes(report_params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(report_params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private

  def report_params
    params.require(:report).permit(:excited, :help_needed, :jelly, :today, :previous_day, achievements_attributes: [:text], tasks_attributes: [:text])
  end
  
end
