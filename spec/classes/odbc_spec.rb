require 'spec_helper'

describe 'odbc' do
  on_puppet_supported_platforms.each do |version, platforms|
    platforms.each do |platform, facts|
      context "on #{version} #{platform}" do
        let (:facts) { facts }

        it { should compile.with_all_deps }
      end
    end
  end
end
