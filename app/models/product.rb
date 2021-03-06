class Product < ApplicationRecord
    
    attr_writer :released_at_text
    

    
    attr_writer :released_at_text
    before_save :save_released_at_text  
    validate :check_released_at_text
  

    
    def price_in_dollars
        price_in_cents.to_d/100 if price_in_cents
    end

    def price_in_dollars=(dollars)
        self.price_in_cents = dollars.to_d * 100 if dollars.present?
    end
    

    def released_at_text
        @released_at_text || released_at.try(:strftime, "%Y-%m-%d %H:%M:%S")
    end
  
  def save_released_at_text
    self.released_at = Time.zone.parse(@released_at_text) if @released_at_text.present?
  end
  
  def check_released_at_text
    if  @released_at_text.present? && Time.zone.parse(@released_at_text).nil?
      errors.add :released_at_text, "cannot be parsed"
    end
  rescue ArgumentError
    errors.add :released_at_text, "is out of range"   
  end
  
end
