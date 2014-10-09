def num_to_s(num, base)
  answer = ''
  divisor = 1
  until divisor > num
    answer << String(((num / divisor) % base))
    divisor *= base
  end
  answer.reverse
end