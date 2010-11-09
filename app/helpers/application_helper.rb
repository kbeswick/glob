module ApplicationHelper
  def clean_date(date)
    "%d/%02d/%02d" % [date.year, date.month, date.day]
  end
end
