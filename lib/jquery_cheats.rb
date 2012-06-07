module JQueryCheats
  require 'railtie' if defined?(Rails)
  module HoverImage
    #class used to do a quick Hover image
    
    #class << self
      
    def mouseoverimage(initimage,hoverimage)
      cheats_image_tag =""
      cheats_image_tag = "<img src=\"#{initimage}\" alt=\"image\" onmouseover=\"$(this).attr('src','#{hoverimage}')\" onmouseout=\"$(this).attr('src','#{initimage}')\">"
      return cheats_image_tag.html_safe
    end
    
    def submitimage(imagepath,alt="Image Tag")
         button_tag = "<a href=\"#\" onclick=\"$('form').submit(); return false;\">
          <img src=\"#{imagepath}\" alt=\"#{alt}\"></a>".html_safe
          button_tag += "<script type=\"text/javascript\">
          $(document).ready(function(){
          $('html').keypress(function(e){
            if(e.which == 13){
             $('form').submit();
              return false;
              }
             });
             });</script>".html_safe
         return button_tag
    end
    
    def simplemolink(imagepath,link)
      hover_arry = imagepath.split('.')
      extension = hover_arry.pop
      newpath = hover_arry.join
      newlink = "<a href=\"#{link}\">#{self.mouseoverimage(imagepath,newpath+"-hover."+extension)}</a>".html_safe
      return newlink
    end
    
    def initialize()
     
    end
    
    #end#end self
    
  end
  
  module Rails
    class Engine<::Rails::Engine
      #rails engine
    end
  end
end