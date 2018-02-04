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
end