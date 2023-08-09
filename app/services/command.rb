class Command

  def success?
    @status
  end

  def success
    @status = true
    self
  end

  def fail?
    !success?
  end

  def fail
    @status = false
    self
  end

  def self.call(*args)
    new(*args).perform
  end
end
