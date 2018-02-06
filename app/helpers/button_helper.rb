module ButtonHelper
  def ok_cancel( args = [] )

    args[:oktext] || args[:oktext]  = "OK";
    args[:canceltext] || args[:canceltext]  = "Cancel";
    @args = { :oktext => "OK", :canceltext => "Cancel" }.merge( args )

    html =
    "<div class=\"button-collection static-buttons save-cancel-container\">
      <div class=\"button-row\">
        <div id=\"cancel-A2\" class=\"button-cell half ion-close icon\"> #{ args[:oktext] }</div>
		    <div id=\"save-A2\" class=\"button-cell half ion-checkmark icon default\">#{args[:canceltext] }</div>
      </div>
    </div>"

    return html.html_safe
  end

  def back_button( args = [] )
    args[:label] || args[:label]  = "Back";
    args[:path] || args[:path]  = "organizations_path";
    args[:buttonType] || args[:buttonType]  = "btn-default";

   html = link_to(("<span class=\"btn-label\"><i class=\"glyphicon glyphicon-chevron-left\"></i></span>#{args[:label]}").html_safe,
                eval( args[:path] ),
                class: "btn btn-labeled btn-#{args[:buttonType]}")

    return html.html_safe
  end

  def edit_button( args = [] )
    args[:label] || args[:label]  = "Edit";
    args[:path] || args[:path]  = "organizations_path";
    args[:buttonType] || args[:buttonType]  = "btn-default";

    html = link_to(("<span class=\"btn-label\"><i class=\"glyphicon glyphicon-pencil\"></i></span>#{args[:label]}").html_safe,
                   eval( args[:path] ),
                   class: "btn btn-labeled btn-#{args[:buttonType]}")

    return html.html_safe
  end

  def submit_button( args )
  # requires the form loop variable
    html = args[:form].submit(class: 'btn btn-primary btn-lg')

    return html.html_safe
  end

  def small_button( args = [] )
    args[:label] || args[:label]  = "New";
    args[:path] || args[:path]  = "new_organization_path";
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

    html = link_to( args[:label].html_safe,
                   eval( args[:path] ),
                   class: "btn btn-xs btn-#{args[:buttonType]} #{args[:class]}")

    return html.html_safe
  end

end