module VisitorsHelper
  def unique_by_factor(factor)
    @project.visitors.select(factor).distinct
  end

  def visitors_where(factor, attrib)
    @project.visitors.where(factor => attrib)
  end

  def views_this_week(project)
    project.visitors.where("created_at > :week", {week: 1.week.ago}).length
  end
end
