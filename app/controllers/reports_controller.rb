class ReportsController < ApplicationController

  before_action :set_report, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /reports
  # GET /reports.json
  def index
    if params[:date]
      @date = Date.parse(params[:date])
      @reports = Report.where(:today => @date).order(:created_at)
      render :date_index and return
    elsif params[:user]
      @user = User.find(params[:user])
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
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    np = @report.next_prev
    @next = np[:next]; @prev = np[:prev]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/present?date=2015-06-07
  def present
    @date = Date.parse(params[:date])
    @reports = Report.where(today: @date).order(:created_at)
    render :present, layout: 'present'
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
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
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
    @report.user ||= current_user

    respond_to do |format|
      if @report.update_attributes(report_params)
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
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:excited, :help_needed, :jelly, :today, :previous_day, achievements_attributes: [:id, :text, :_destroy], tasks_attributes: [:id, :text, :_destroy])
  end
  
end
