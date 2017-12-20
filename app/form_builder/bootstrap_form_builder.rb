class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, to: :@template
    def text_field(name,*arg)
        content_tag :div, class:"form-group" do
            content_tag :label, name: name + super(name,*arg)
        end
    end
end
