require 'nokogiri'

module Jekyll 
    module BadwordFilter
    
        def BadWordRem(content)
        #removes bad words from a post
        bad = ["cunt","nigger","bitch","ass","fuck"]
        frag = Nokogiri::HTML::DocumentFragment.parse(content)
        
        html = frag.inner_html
        
        frag.css('p').each do |p|
            h = p.content
           
            bad.each { |w| h =  h.gsub(/(#{w})/i,"<span id=curse>\\1</span>") }  
           # p.content.split.each do |w|
           #     if bad.include? w
           #         h = h.gsub(w,"<span id=curse>"+w+"</span>")
           #     end
           # end
         html = html.gsub(p,h)
        end
        
        html
        end
    
    end
end
Liquid::Template.register_filter(Jekyll::BadwordFilter)