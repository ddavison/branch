require 'spec_helper'
require 'fileutils'

module Branch
  describe Branch do
    let(:args) {['src','dest1','dest2']}
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

      it 'should parse the directories from the arguments' do
        subject.dirs.should_not be_empty

        subject.dirs.each do |dir|
          Dir.exists?(dir).should eql(true)
        end
      end
    end

    context '::branch' do
      it 'should copy to 1 directory' do
        subject.branch

        # the file should exist.
        File.exists?(File.expand_path('dest1/src')).should eql(true)
      end

      it 'should copy to multiple directories' do
        subject.branch

        File.exists?(File.expand_path('dest1/src')).should eql(true)
        File.exists?(File.expand_path('dest2/src')).should eql(true)
      end

      it 'should ensure that the contents of the files persist' do
        subject.branch

        File.open('src', "r") do |file|
          file.read.should eq 'content'
        end
      end
    end

    context 'with options...' do
      # when we specify options, they will go as contexts here.
    end

    after(:each) do
      # delete the src file, and the 2 dest folders.
      File.delete('src')
      FileUtils.rm_rf('dest1')
      FileUtils.rm_rf('dest2')
    end
  end
end