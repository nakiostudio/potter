module Potter
  class Manager
    def work(options)
      Potter.config = options
      return Runner.new.run
    end
  end
end
