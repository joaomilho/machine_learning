require 'matrix'

X = Matrix[ [1,4,89], [1,9,124], [1,5,103] ]
y = Matrix[ [16], [28], [20] ]

@tetas = (((X.transpose*X)**-1)*X.transpose)*y

def prediction age, height
  @tetas[0,0] + age*@tetas[1,0] + height*@tetas[2,0]
end

