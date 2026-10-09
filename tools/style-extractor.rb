require 'set'

# Path to the folder containing .plt files (after cloning the repo)
THEMES_PATH = ARGV[0]

# To store: { "classDiagram" => Set[:BackgroundColor, :RoundCorner], ... }
style_map = Hash.new { |h, k| h[k] = Set.new }
current_block = "global"

Dir.glob("#{THEMES_PATH}/*.puml").each do |file|
  File.foreach(file) do |line|
    line = line.strip
    next if line.start_with?("'") || line.empty?

    # Detect Block Start: e.g., "classDiagram {"
    if line =~ /^([\w\d\s]+)\s*\{/
      current_block = $1.strip
    end

    # Detect Block End
    if line == "}"
      current_block = "global"
    end

    # Extract Properties: e.g., "BackgroundColor #FFFFFF"
    if line =~ /^([\w\d\s]+)\s+([#\w\d]+)/
      style_map[current_block] << $1.strip
    end
  end
end

final_map = style_map.transform_values { |v| v.to_a.sort }

final_map.each do |block, props|
  puts "\n[ #{block} ]"
  puts props.join("\n")
end
