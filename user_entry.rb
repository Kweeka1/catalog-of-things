class UserEntry
  def self.get_str(param_name, error = '')
    print param_name
    input = gets.chomp

    if input.length > 50 || input.length < 3
      puts error
      return get_str(param_name, error)
    end
    input
  end

  def self.get_number(param_name, error = '')
    print param_name
    input = gets.chomp
    converted = input.to_i

    unless converted.positive? || input == '0'
      puts error
      return get_number(param_name, error)
    end
    converted
  end

  def self.get_date(param_name, error = '')
    print param_name
    input = gets.chomp

    begin
      Date.parse(input)
    rescue Date::Error
      puts error
      get_date(param_name, error)
    end
  end

  def self.get_bool(param_name, error = '')
    print param_name
    input = gets.chomp

    begin
      Boolean.new(input).value
    rescue StandardError
      puts error
      get_bool(param_name, error)
    end
  end
end

class Boolean
  attr_reader :value

  def initialize(str)
    case str
    when 'y', 'yes', 'Yes', 'Y', 'YES'
      @value = true
    when 'n', 'no', 'No', 'N', 'NO'
      @value = false
    end
  end
end
