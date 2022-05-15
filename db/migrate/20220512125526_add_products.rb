class AddProducts < ActiveRecord::Migration[7.0]
  def change
    Product.create ({
      :title => 'Peperony', 
      :description => 'This is Peperony pizza', 
      :price => 350, 
      :size => 30, 
      :is_spicy => false, 
      :is_vag => false, 
      :is_best_offer => true, 
      :path_to_image => '/images/pizza-paperony.jpg'
    })
    
    Product.create ({
        :title => 'Rustic',  
        :description => 'This is Rustic pizza',
        :price => 370, 
        :size => 30, 
        :is_spicy => false, 
        :is_vag => true, 
        :is_best_offer => false, 
        :path_to_image => '/images/pizza-rustic.jpg'
    })
    
    Product.create ({
        :title => 'Italian', 
        :description => 'This is Italian pizza', 
        :price => 365, 
        :size => 30, 
        :is_spicy => false, 
        :is_vag => false, 
        :is_best_offer => false, 
        :path_to_image => '/images/pizza-2.jpg'
    })
    end
end
