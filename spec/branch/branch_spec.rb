require 'spec_helper'

module Branch
  describe Branch do
    let(:args) {['src']}
    subject {Runner.new(args)}

    before(:each) do
      # create the test file.
      File.open("src", "w") { |file| file.write('content') } unless File.exists?('src')
      Dir.mkdir('dest1') unless Dir.exists?('dest1')
      Dir.mkdir('dest2') unless Dir.exists?('dest2')
    end


    context '::new' do
      it 'should parse the file from the arguments' do
        subject.file.should eq File.expand_path('src')
      end

      it 'should parse the directories from the arguments'
    end

    context 'branch' do
      it 'should copy to 1 directory'
      it 'should copy to multiple directories'
    end

    after(:all) do
      # delete the src file, and the 2 dest folders.
      File.delete('src')
      Dir.delete('dest1')
      Dir.delete('dest2')
    end
  end
end