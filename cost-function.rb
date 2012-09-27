PHI0 = 0
PHI1 = 1

class Array

  def sum
    @sum ||= inject(0){|s,i| s+i }
  end

  def avg
    @avg ||= sum / size.to_f
  end

  def sample_variance
    @sample_variance ||= inject(0){|s, i| s +(i-avg)**2 } / (size - 1).to_f
  end

  def stddev
    @stddev ||= Math.sqrt(sample_variance)
  end
end
class Dataset < Array
  def inspect
    "<Dataset #{super.inspect}>"
  end  
  def m
    size
  end
  def n
    @n ||= first.size
  end
  def cost
    (1.0/(2.0*m))*sum_steps.sum
  end
  def sum_steps
    self.map{|i| (h(i[0..-2]) - i.last) ** 2 }
  end
  def self.J *tetas
    @@tetas = tetas
  end
  def h row
    # raise row.inspect
    # puts "#{s}--#{i}--#{@@tetas.inspect}";
    @@tetas[0] + row.each.with_index.inject(0){|sum,(item,index)| sum + item*@@tetas[index-1]}
  end
  def normalize
    # map{|row| }
    # return columns_info
    Dataset.new map{|row|
      row.each_with_index.map{|col,i|
        # if i == (row.size-1)
        #   col
        # else
        (col - columns_info[i][:avg]) / columns_info[i][:stddev]
        # end
      }
    }
  end
  def columns_info
    @columns_info ||= columns.map{|c| {avg: c.avg, stddev: c.stddev} }
  end
  def columns
    @columns = []
    c = clone
    0.upto(first.size-1) do |i|
      @columns << c.map{|row| row[i] }
    end
    # raise @columns.inspect
    @columns
  end
  
end

dataset = Dataset.new [[150,4,4500],[100,2,1800],[120,4,3600],[50,1,1100]]

place = [0,0,0]
lr = 0.1
1000.times do 
  
  puts place
  Dataset.J(*place)
  # place = place.map{|i| i + lr }
  puts dataset.normalize.cost
  place[0] += lr
  sleep 0.5
end

