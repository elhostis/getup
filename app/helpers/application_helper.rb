module ApplicationHelper

  # Write the meta tags of an organisation
  #
  def open_graph_meta_tags
    title = @current_organisation.title
    image = @current_organisation.current_logo
    description = ""

    if @project
      title = @project.title
      description = raw(@project.description)
      image = @project.project_images.first.image if @project.project_images.first
    end

    {
      :site_name => @current_organisation.get_field_for_locale('association_name'),
      :type  => 'website',
      :title => title,
      :description => Sanitize.clean(description),
      :image => image,
      :url   => url_for(:only_path => false)
    }.map do |property, content|
      tag(:meta, :property => "og:#{property}", :content => content)
    end.join("\n").html_safe
  end


  def body_id
    "#{params[:controller].split('/')[1]}-#{params[:action].to_s}"
  end

end
