module PageElementsHelper
  def page_title( args = {} )
    has_title = args[:title].present?
    has_entity = args[:form_for].present?

    html = ''
      html << '<div class="container">
                <div class="row  content-row">
                  <div class="col  content-col">'
      if has_title
        html <<
          '<div id="content-header" class="row">
            <div class="col">
              <h1>' + args[:title] + '</h1>
            </div>
          </div>'
      end
      if has_entity
        if args[:form_for].errors.any?
          html <<
            '<div id="error_explanation" class="row form-errors">
              <div class="col">
               <h2>' + pluralize(args[:form_for].errors.count, "error") + ' prohibited this from being saved:</h2>
            <ul>'
              args[:form_for].errors.full_messages.each do |message|
                html <<  '<li>' + message + '</li>'
             end
          html <<  '</ul>
              </div>
             </div>'
        end
      end
    return html.html_safe
  end

  # Assumes that there is an open 'row' div before this block(as generated by page_title or page_footer)
  def section_title( args={} )
    has_title = args[:title].present?
    html = ''
    if has_title
      html << '
            <div class="row">
              <div class="col">
                  <h3>' + args[:title] + '</h3>
              </div>
            </div>'
    end
    return html.html_safe
  end

  def page_footer( args={} )
    html = ''

    html << '</div>  <!-- end of content-col -->'
    html << '</div>  <!-- end of content-row -->'
    html << '</div>  <!-- end of content container-->'
    html << '<footer id="content-footer">'
    html << '<row id="content-footer-row" class="row">'
    html << '<row class="col">'
    return html.html_safe
  end


  def page_end( args={} )

    html =  '</div>    <!-- end of footer col -->'
    html << '</div>    <!-- end of content-footer-row -->'
    html << '</footer> <!-- end of footer -->'
    return html.html_safe
  end



end