# XeLaTeX is required for XePersian.
$pdflatex = 'xelatex -halt-on-error -interaction nonstopmode %O %S';

$aux_dir = 'aux';
$out_dir = 'build';

# Used for creating a glossary.
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
  system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}
