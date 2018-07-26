  modify({:type => :HeadedSection}) do
    @node.classes ||= []
    @node.classes << 'page' if @node.level == 1
    @node.classes << 't' if @node.params[0]&.text == 't'
    @node.classes << 'bookguide' if @node.params[0]&.text == 'bookguide'
    @node.classes << 'license' if @node.params[0]&.text == 'license'
  end
  modify 'l' do
    @node.add_attr 'target' => ['_blank']
  end
