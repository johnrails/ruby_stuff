def with_return_and_new
  prc = Proc.new { return 'This is printed'}
  prc.call
  'Never seen'
end

def no_return_with_new
  prc = Proc.new { 'no_return_with_new'}
  prc.call
  'This is printed'
end

def with_return_and_lambda
  prc = lambda { return 'with_return_and_lambda'}
  prc.call
  'This is printed'
  
end

p with_return_and_new
p no_return_with_new
p with_return_and_lambda
