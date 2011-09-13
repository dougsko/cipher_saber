require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CipherSaber" do
    it "decrypts CSTEST1.CS1" do
        iv = ""
        File.open('spec/CSTEST1.CS1', 'rb') do |f|
            f.each_byte do |b|
                iv << b.chr
            end
        end
        r = CipherSaber.new('asdfg' + iv[0..9], 1)
        d = r.decrypt(iv[10..iv.length])
        d.should match "This is a test of CipherSaber."
    end

    it "decrypts CS2TEST1.CS2" do
        iv = ""
        File.open('spec/CS2TEST1.CS2', 'rb') do |f|
            f.each_byte do |b|
                iv << b.chr
            end
        end
        r = CipherSaber.new('asdfg' + iv[0..9], 10)
        d = r.decrypt(iv[10..iv.length])
        d.should match "This is a test of CipherSaber-2."
    end
end
