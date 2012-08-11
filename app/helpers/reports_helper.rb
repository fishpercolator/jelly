module ReportsHelper

  # Coordinates of the jelly babies 1-23 on the diagram
  def jelly_coords
    %w{15,3,103,133 135,45,197,163 212,14,329,88 349,0,403,36
       516,0,576,95 249,174,277,213 401,118,452,246 510,160,577,295
       42,201,92,298 169,255,219,358 217,255,263,358 311,288,393,410
       76,451,130,573 130,449,171,583 201,416,277,528 525,405,601,560
       343,495,414,633 43,713,139,812 144,640,248,758 266,656,322,780
       321,708,354,832 427,673,499,792 406,809,533,857}
  end

  # Text representing the given date with reference to the specified reference date, 
  # e.g. "On Wednesday" or "Yesterday"
  def date_text(date, reference_date)
    if date == reference_date
      "Today"
    elsif date == reference_date - 1
      "Yesterday"
    elsif date > reference_date - 7
      "On #{date.strftime '%A'}"
    else
      "On #{date.strftime '%e %b'}"
    end
  end
  
end
