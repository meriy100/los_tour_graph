require "csv"
require "active_support/all"

dot = <<'EOS'
digraph graph_name {
  graph [
    charset = "UTF-8";
    labelloc = "t",
    labeljust = "c",
    bgcolor = "#ffffff",
    fontcolor = white,
    fontsize = 18,
    style = "filled",
    rankdir = TB,
    margin = 0.2,
    layout = dot
  ];
  node [
    colorscheme = "rdylgn11"
    style = "solid,filled",
    fontsize = 14,
    fontcolor = 6,
    fontname = "Migu 1M",
    color = 7,
    fillcolor = 11
  ];
  edge [
    color = "#000000"
  ];

EOS

states = []
edge_defines = []


CSV.open ARGV.first, "r" do |file|
  file.shift
  file.each do |line|
    if states.include? line.first
      states.push line.first
    end
    edge_defines.push "\"#{line.first}\" -> \"#{line.fifth}\" [label = \"#{line.third}\"];"
  end
end

dot << states.join(";\n")

dot << edge_defines.join("\n")
dot << "}"
puts dot
