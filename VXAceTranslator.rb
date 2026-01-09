require_relative 'Modules/RVData2Decompiler'
require_relative 'Modules/RVData2Compiler'
require_relative 'Modules/Utils'
require_relative 'Modules/RPG'
require 'optparse'
require 'zlib'
require 'fileutils'

$test = false
$stdout.sync = true

# === УМНЫЙ РЕЖИМ (SMART MODE) ===
# Исправление: !defined?(Ocra) предотвращает запуск кода во время сборки EXE
if ARGV.empty? && !defined?(Ocra)
  current_dir = Dir.pwd
  decompiled_dir = File.join(current_dir, "Decompiled")

  puts "Working directory: #{current_dir}"

  # Если папка Decompiled существует — значит мы хотим собрать игру обратно
  if Dir.exist?(decompiled_dir)
    puts "#{GREEN_COLOR}Found 'Decompiled' folder. Mode: COMPILE#{RESET_COLOR}"
    
    # Папка для сборки
    output_dir = File.join(current_dir, "Compiled")
    output_data_dir = File.join(output_dir, "Data")
    
    # Создаем папку Data
    FileUtils.mkdir_p(output_data_dir)

    c = RVData2Compiler.new
    # (game_path, input_path, output_path, target, indexless, force_decrypt)
    c.compile(current_dir, decompiled_dir, output_data_dir, '', true, false)
    
    puts "\n#{GREEN_COLOR}Done! Copy 'Data' from 'Compiled' folder to your game directory.#{RESET_COLOR}"
    
    puts "Press Enter to exit..."
    gets
    exit

  else
    # Если папки нет — значит декомпилируем
    puts "#{BLUE_COLOR}No 'Decompiled' folder found. Mode: DECOMPILE#{RESET_COLOR}"
    
    d = RVData2Decompiler.new
    # (game_path, output_path, target, indexless, force_decrypt)
    d.decompile(current_dir, decompiled_dir, '', true, false)
    
    puts "\n#{GREEN_COLOR}Done! Files are in 'Decompiled' folder.#{RESET_COLOR}"
    
    puts "Press Enter to exit..."
    gets
    exit
  end
end
# ================================

USAGE = "#{RED_COLOR}Decompiler Usage: VXAceTranslator.exe -d GAME_DIR -o OUTPUT_DIR [Optional]
Compiler Usage: VXAceTranslator.exe -c GAME_DIR -i INPUT_DIR [Optional] -o OUTPUT_DIR [Optional]#{RESET_COLOR}"

options = {}
options[:target_basename] = ''
options[:input] = ''
options[:output] = ''
options[:indexless] = true
options[:force_decrypt] = false

while (arg = ARGV.shift)

  case arg
  when '-d', '--decompile'
    options[:decompile] = ARGV.shift
  when '-c', '--compile'
    options[:compile] = ARGV.shift
  when '-t', '--target'
    options[:target_basename] = ARGV.shift
  when '-i', '--input'
    options[:input] = ARGV.shift
  when '-o', '--output'
    options[:output] = ARGV.shift
  when '--switch-indexless'
    options[:indexless] = false
  when '--force-decrypt'
    options[:force_decrypt] = true
  when '-h', '--help'
    print USAGE
    $stdout.flush

    exit
  else
    print USAGE
    $stdout.flush

    exit
  end

end

unless options[:decompile] || options[:compile]
  # Если Ocra собирает проект, она может вызвать скрипт без аргументов,
  # поэтому не выводим USAGE во время сборки, просто выходим.
  if defined?(Ocra)
    exit
  end
  
  puts USAGE
  exit
end

unless ENV["OCRA_EXECUTABLE"].nil?
  Dir.chdir(File.dirname(ENV["OCRA_EXECUTABLE"]))
end

if not options[:decompile].nil?
  d = RVData2Decompiler.new
  d.decompile(options[:decompile],
              output_path=options[:output],
              target_basename=options[:target_basename],
              indexless=options[:indexless],
              force_decrypt=options[:force_decrypt])


elsif not options[:compile].nil?
  c = RVData2Compiler.new
  c.compile(options[:compile],
            input_path=options[:input],
            output_path=options[:output],
            target_basename=options[:target_basename],
            indexless=options[:indexless],
            force_decrypt=options[:force_decrypt])


end
