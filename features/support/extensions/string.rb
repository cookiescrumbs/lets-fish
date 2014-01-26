class String
  def valid_float?
    # The double negation turns this into an actual boolean true - if you're 
    # okay with "truthy" values (like 0.0), you can remove it.
    !!Float(self) rescue false
  end
end