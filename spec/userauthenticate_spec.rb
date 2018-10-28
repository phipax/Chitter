require './lib/userauthenticate'

describe 'TDD for validating User Authentication Class' do
  context 'Check for instance of the class' do
    it 'Validate instance of UserAuthenticate class' do
      expect(UserAuthenticate.new).to be_instance_of(UserAuthenticate)
    end
  end

  context 'Check for Class Method#self.validate' do
    it 'Validate call to instance method through the Class Method' do
      ua = UserAuthenticate.new
      expect(ua.authuser('jbloggs','dummy'))
      UserAuthenticate.validate("jbloggs","dummy")
    end
  end

  context 'Check for instance Method#AuthUser' do
    it 'Check for the return status from #AuthUser' do
      ua = UserAuthenticate.new
      expect(ua.authuser('jdoe','dummy'))
      UserAuthenticate.validate("jdoe","dummy")
    end
  end
end

describe 'Check for return values from SQL interaction' do
  context 'Check for the attribute variable set through #self.validate' do
    it 'Check for return value' do
      expect(UserAuthenticate.validate('jwinny','dummy')).to eq true
    end
  end

  context 'Check for the attribute variable set through #AuthUser' do
    it 'Check for return from SQL' do
      ua = UserAuthenticate.new
      ua.authuser('jbloggs','dummy')
      expect(ua.user_hash[:user_name]).to eq 'Joe Bloggs'
    end
  end

end
