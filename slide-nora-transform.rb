require 'rouge'
modify({:type => :HeadedSection}) do
  @node.classes ||= []
  @node.classes << 'page' if @node.level == 1
  @node.classes << 'page' if @node.params[0]&.text == 'p'
  @node.classes << 't' if @node.params[0]&.text == 't'
  @node.classes << 'page' if @node.params[0]&.text == 't'
  @node.classes << 'bookguide' if @node.params[0]&.text == 'bookguide'
  @node.classes << 'license' if @node.params[0]&.text == 'license'
end
modify 'l' do
  @node.add_attr 'target' => ['_blank']
end
replace ({type: :PreformattedBlock}) do
  return @node if @node.name != 'code'

  case @node.codelanguage
  when 'ruby'
    lexer = Rouge::Lexers::Ruby.new
  when 'rust'
    lexer = Rouge::Lexers::Rust.new
  when 'js'
    lexer = Rouge::Lexers::Javascript.new
  when 'c'
    lexer = Rouge::Lexers::C.new
  else
    lexer = Rouge::Lexers::Shell.new
  end
  formatter = Rouge::Formatters::HTML.new
  html = formatter.format(lexer.lex(@node.content.join "\r\n"))
  text_node = text(html, raw_text: true)
  text_node.noescape = true
  code_node = block('code', text_node)
  block('pre', code_node, classes: ['highlight'] )
end
