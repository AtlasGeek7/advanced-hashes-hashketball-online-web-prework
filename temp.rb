$words, $level, $ctr = [], 0, 0
function gameMenu()
  puts "[1] Easy"
  puts " [2] Medium"
  puts " [3] Hard"

  loop do 
    puts "Select level:"
    $level = gets.chomp
  break if !(($level[0]).ord > 51 || ($level[0]).ord < 49 || $level === '')
  $level = $level.to_i
endloop do 
puts "Select level:"
$level = gets.chomp
break if !(($level[0]).ord > 51 || ($level[0]).ord < 49 || $level === '')
$level = $level.to_i
end

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

setting = []
setting.push(ctr)
setting.push(words)
return setting
end

=begin
https://www.grammarly.com/blog/14-of-the-longest-words-in-english/
https://www.fluentu.com/blog/english/weird-strange-english-words/
=end

fun = true
setting = []
str = ''
arr = []
rndArr = []
rnd = 0

loop do
  puts "===================================="
  puts "*****         HANGMAN          *****"
  puts "===================================="
  puts "((Coded by ~o0O([AtlasLion7])O0o~ ))"
setting = gameMenu()
$words = setting[1]
$ctr = setting[0]

  loop do
    rnd = Math.floor(Math.random() * 7)
  break if !(rndArr.includes(rnd))
  rndArr.push(rnd)
  str = $words[rnd]
  arr = str.split('')
  let disp = []
  let holder = []
  disp[0] = '[' + arr[0] + ']'
  holder[0] = ''
  arr[0] = '[' + arr[0] + ']'
  let i = 0
  for i in 1..arr.length-1 do
    holder[i] = arr[i]
    arr[i] = '[' + arr[i] + ']'
    disp[i] = '[*]'
  end
  disp.push('[' + arr[arr.length-1] + ']')
  holder.push('')
  arr[i] = '[' + arr[i] + ']'
  letter = ''
  dispStr = disp.to_s.gsub(/[,]/, '') 
  puts '\n' + dispStr
  score = 0
  while (disp.to_s != arr.to_s && $ctr > 0)
    loop do 
    letter = input.question("Enter a letter:")
    letter = letter.toUpperCase()
    break if !(letter.length > 1 || letter === '' || Number(letter.charCodeAt(0)) > 90 || Number(letter.charCodeAt(0)) < 65)
    end
    if (holder.includes(letter))
    splice(holder.indexOf(letter), 1, '[' + letter + ']')
      dispStr = disp.to_s.gsub(/[,]/, '') 
      holder.splice(holder.indexOf(letter), 1, '')
      score += 10;
    else
      ctr -= 1
      puts `>>> #{ctr} attempts left... <<<`
    end
    puts dispStr
    puts `>>> Score: #{score} <<<`
    if ($ctr === 0)
      #console.log(`The correct word was: \n${words[rnd]}`)
      puts "\n================="
      puts "  GAME OVER !!!"
      puts "================="
    else
      puts "\n================="
      puts " GOOD GUESS !!!"
      puts "================="
    end

puts `The correct word was: \n#{words[rnd]}\n`
loop = ''
while (loop.toUpperCase() != 'Y' && loop.toUpperCase() != 'N')
  loop = input.question("New game? (Y/N) ")
  if (loop.upcase === 'Y')
    fun = true
  else
    fun = false
  end
end

break if (!fun)
end