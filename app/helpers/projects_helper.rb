module ProjectsHelper
  def visitor_durations(project)
    durations = []
    project.visitors.each do |visitor|
      durations << (visitor.departure - visitor.arrival)/60
    end
    return durations
  end

  def visitor_cities(project)
    cities = {}
    cities_array = []
    project.visitors.each do |visitor|
      if cities[visitor.city]
        cities[visitor.city] += 1
      else
        cities[visitor.city] = 1
      end
    end
    cities.each do |city, value|
      city = "Unknown" if city == ""
      cities_array << {label: city, value: value}
    end
    return cities_array
  end

  def visitor_destinations(project)
    links = {}
    project.visitors.each do |visitor|
      if links[visitor.destination]
        links[visitor.destination] += 1
      else
        links[visitor.destination] = 1
      end
    end
    links_array = []
    links.each do |link, value|
      link = "External Link" if link == nil
      link = link.gsub("http://", "")
      link =link.gsub(/(.com)\*/, ".com")
      links_array << {label: link, value: value}
    end
    return links_array
  end
end
