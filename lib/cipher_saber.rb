#!/usr/bin/env ruby
#
# CipherSaber 2 implementation in Ruby
#
# Doug Prostko 2011
#

class CipherSaber
    def initialize(key, n)
        @key = []
        @s = (0..255).to_a
        j = 0
        temp = 0

        key.each_byte do |byte|
            @key << byte
        end
        
        n.times do
            0.upto(255) do |i|
                j = (j + @s[i] + @key[i % @key.length]) % 256
                temp = @s[i]
                @s[i] = @s[j]
                @s[j] = temp
            end
        end
    end

    def encrypt(text)
        i = 0
        j = 0
        temp = 0 
        cipher_text = ""
        text.each_byte do |byte|
            i = (i + 1) % 256
            j = (j + @s[i]) % 256
            temp = @s[i]
            @s[i] = @s[j]
            @s[j] = temp
            k = @s[(@s[i] + @s[j]) % 256]
            cipher_text << (k ^ byte)
        end
        cipher_text
    end

    alias_method :decrypt, :encrypt
end

