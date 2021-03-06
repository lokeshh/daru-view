require_relative 'layout_helper_iruby'
require_relative 'iruby_notebook'

module LazyHighCharts

  def self.init_script(
    dependent_js=['highcharts.js', 'highcharts-3d.js', 'highstock.js']
  )
    js =  ""
    js << "\n<script type='text/javascript'>"
    js << LazyHighCharts.generate_init_code(dependent_js)
    js << "\n</script>"
    js
  end

  class HighChart
    # @example
    #
    # To display the html code of the chart, use `to_html`. To see the same
    # in IRuby notebook use `show_in_iruby`.
    # User can also use :
    # `IRuby.html chart.to_html` (or)
    # `IRuby.html chart.to_html.to_s` (or)
    # `IRuby.display chart.to_html, mime: 'text/html'`
    # to get the same chart in IRuby notebook.
    #
    def to_html
      high_chart(random_canvas_id, self)
    end

    def show_in_iruby(placeholder=random_canvas_id)
      IRuby.html high_chart(placeholder, self)
    end

  end
end