module EncryptHelper

  def encrypt(string)
    salt_charset = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    salt = "" << salt_charset[rand salt_charset.size-1] << salt_charset[rand salt_charset.size-1]
    return string.crypt(salt)
  end

  def match(string, encrypted)
    if string.crypt(encrypted) == encrypted
      return true
    else
      return false
    end
  end

end
