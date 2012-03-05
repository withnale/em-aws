# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :specs do
  guard 'rspec', version: 2, cli: '-c -f doc' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  end
end

group :doc do
  guard 'yard' do
    watch(%r{app/.+\.rb})
    watch(%r{lib/.+\.rb})
    watch(%r{ext/.+\.c})
    watch('README.markdown')
  end
end