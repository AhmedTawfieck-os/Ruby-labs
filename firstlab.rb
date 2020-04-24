class MyComplexNumber

    attr_accessor :real, :img
    
     @@operation= { "sum" => 0, "multiplication" =>0, "bulk_add" =>0, "bulk_multiply" => 0 }
     @@sign=0
    
    
    def initialize(real, img)
      @real =real 
      @img =img 
    end

    def to_s
        "#{ self.real} + #{ self.img}(i)"
    end

    def +(other)
    
        if(@@sign!=1)
		 then @@operation['sum']+=1
		 else @@operation['bulk_add']+=1 
	end
        @real += other.real
        @img += other.img
        return ComplexNumber.new(@real,@img)
    end

    def *(other)
        if(@@sign!=1)
		 then @@operation['multi']+=1 
		 else @@operation['bulk_multiply']+=1 
	 end
      
        new_a = @real * other.real - img * other.img
        @img = @img * other.real + @real * other.img
        @real = new_a
        self
    end

    def self.bulk_add(other)
        @@sign=1
        bulkAll=ComplexNumber.new(0,0)
        other.each{|obj| bulkAll+=obj }
        @@sign=0
        return bulkAll
    end

    def self.bulk_multiply(other)
        @@sign=1
        bulkAll=ComplexNumber.new(1,1)
        other.each{|obj| bulkAll*=obj }
        @@sign=0
        return bulkAll
    end


end

c1=ComplexNumber.new(3,2)
c2=ComplexNumber.new(1,7)


# add
puts " sum = #{(c1+c2).to_s}"

# multi
puts " multiplication= #{(c1*c2).to_s}"

# bulk_Add
c3=ComplexNumber.new(5,8)
arrayOfObj=[c1,c2,c3]

puts "bulk_Add = #{ComplexNumber.bulk_add(arrayOfObj).to_s}"


# bulk_multiply
puts "bulk_multiply = #{ComplexNumber.bulk_multiply(arrayOfObj).to_s}"


