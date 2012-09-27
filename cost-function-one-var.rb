PHI0 = 0
PHI1 = 1

class Array
  def sum
    self.inject(0){|s,i| s+i }
  end
end
class Dataset < Array
  def inspect
    "<Dataset #{super.inspect}>"
  end  
  def cost
    (1.0/(2.0*size))*sum_steps.sum
  end
  def sum_steps
    self.map{|i| (h(i[0]) - i[1]) ** 2 }
  end
  def self.J phi0, phi1
    @@phi0 = phi0
    @@phi1 = phi1
  end
  def h x
    @@phi0 + @@phi1 * x
  end
end
Dataset.J(0,0)
dataset = Dataset.new [[3,4],[2,1],[4,3],[0,1]]
puts dataset.cost