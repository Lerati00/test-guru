module GistsHelper
  def short_link(string, max_length)
    string.length <= 25 ? string : string[0..max_length-3] + "..."
  end
end
