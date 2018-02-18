module ButtonHelper

  def back_button( args = {} )
    args[:label] || args[:label]  = "Back";
    args[:path] || args[:path]  = eval( "ProcessOwners_path" );
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

   html = link_to(("<span class=\"btn-label\"><i class=\"glyphicon glyphicon-chevron-left\"></i></span>#{args[:label]}").html_safe,
                args[:path],
                class: "btn btn-labeled btn-#{args[:buttonType]}  #{args[:class]}")
    return html.html_safe
  end

  def edit_button( args = {} )
    args[:label] || args[:label]  = "Edit";
    args[:path] || args[:path]  = eval( "ProcessOwners_path" );
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

    html = link_to(("<span class=\"btn-label\"><i class=\"glyphicon glyphicon-pencil\"></i></span>#{args[:label]}").html_safe,
                   args[:path] ,
                   class: "btn btn-labeled btn-#{args[:buttonType]}  #{args[:class]}")

    return html.html_safe
  end

  def submit_button( form,  args = {} )
  # requires the form loop variable
  #  args[:label] || args[:label]  = "Save";
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

    html = form.submit(  class: "btn btn-lg btn-#{args[:buttonType]}  #{args[:class]}")
    return html.html_safe
  end

  def small_button( args = {} )
    args[:label] || args[:label]  = "New";
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

    html = link_to( args[:label].html_safe,
                   args[:path],
                   class: "btn btn-xs btn-#{args[:buttonType]} #{args[:class]}")
    return html.html_safe

  end

  def new_button( args = {} )
    args[:label] || args[:label]  = "New";
    args[:buttonType] || args[:buttonType]  = "primary";
    args[:class] || args[:class]  = "";

    html = link_to( args[:label].html_safe,
                    args[:path],
                    class: "btn btn-xs btn-#{args[:buttonType]} #{args[:class]}")
    return html.html_safe

  end

end