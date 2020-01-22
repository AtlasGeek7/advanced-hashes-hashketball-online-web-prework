$words, $level, $ctr = [], 0, 0
def gameMenu()
  puts " [1] Easy"
  puts " [2] Medium"
  puts " [3] Hard"
  loop do 
    puts "Select level:"
    $level = gets.chomp
  break if !(($level[0]).ord > 51 || ($level[0]).ord < 49 || $level === '')
  end
  $level = $level.to_i
  case ($level)
    when 1
      $words = ["BANANA", "ORANGE", "PINEAPPLE", "MANGO", "GRAPE", "APPLE", "MELON"]
      $ctr = 11
    when 2
      $words = ["CACOPHONY", "RAGAMUFFIN", "GOBBLEDYGOOK", "GIBBERISH", "POPPYCOCK", "CURMUDGEON", "WOEBEGONE"]
      $ctr = 8
    when 3
      $words = ["ANTIDISESTABLISHMENTARIANISM", "INCOMPREHENSIBILITIES", "EUOUAE", "HONORIFICABILITUDINITATIBUS", "SESQUIPEDALIANISM", "UNCOPYRIGHTABLE", "UNIMAGINATIVELY"]
      $ctr = 6
    else
      $words = ["BANANA", "ORANGE", "PINEAPPLE", "MANGO", "GRAPE", "APPLE", "MELON"]
    end
  $setting = []
  $setting.push($ctr)
  $setting.push($words)
  return $setting
end

=begin
https://www.grammarly.com/blog/14-of-the-longest-words-in-english/
https://www.fluentu.com/blog/english/weird-strange-english-words/
=end

$fun = true
$setting = []
$str = ''
$arr = []
$rndArr = []
$rnd = 0

loop do
  puts "===================================="
  puts "*****         HANGMAN          *****"
  puts "===================================="
  puts "((Coded by ~o0O([AtlasLion7])O0o~ ))"
  $setting = gameMenu()
  $words = $setting[1]
  $ctr = $setting[0]

  loop do
    $rnd = (rand(0..6)).floor()
  break if !($rndArr.include?($rnd))
  end
  $rndArr.push($rnd)
  $str = $words[$rnd]
  #puts $str
  $arr = $str.split('')
  #puts $arr
  disp = []
  holder = []
  disp[0] = '[' + $arr[0] + ']'
  holder[0] = ''
  $arr[0] = '[' + $arr[0] + ']'
  i = 1
  while i < $arr.length-1
    holder[i] = $arr[i]
    $arr[i] = `[ #{$arr[i]} ]`
    disp[i] = "[*]"
    i += 1
  end
  #disp.push($arr[$arr.length-1])
  disp.push('[' + $arr[$arr.length-1] + ']')
  holder.push('')
  $arr[i] = `[ #{$arr[i]} ]`
  letter = ''
  dispStr = disp.to_s.gsub(/[,""]/, '') 
  puts dispStr
  score = 0
  while (disp.to_s != $arr.to_s && $ctr > 0)
    loop do 
      puts "Enter a letter:"
      letter = gets.chomp
      letter = letter.upcase
    break if !(letter.length > 1 || letter === '' || (letter[0]).ord > 90 || (letter[0]).ord < 65)
    end
    if (holder.include?(letter))
      #puts `disp= #{disp}`
      disp.slice!(holder.index(letter), 1, '[' + letter + ']')
      dispStr = disp.to_s.gsub(/[,""]/, '') 
      holder.slice!(holder.index(letter), 1, '')
      score += 10;
    else
      $ctr -= 1
      puts `>>> #{$ctr} attempts left... <<<`
    end
    puts dispStr
    puts `>>> Score: #{score} <<<`
    if ($ctr === 0)
      #console.log(`The correct word was: \n${words[rnd]}`)
      puts "================="
      puts "  GAME OVER !!!"
      puts "================="
    else
      puts "================="
      puts " GOOD GUESS !!!"
      puts "================="
    end
    puts `The correct word was: \n#{words[rnd]}\n`
  end
  loop = ''
  while (loop.upcase != 'Y' && loop.upcase != 'N')
    loop = input.question("New game? (Y/N) ")
    if (loop.upcase === 'Y')
      $fun = true
    else
      $fun = false
    end
  end

break if (!$fun)
end