module ApplicationHelper


  # NOTE:  pass a string to methods

    # convert SSN/ITIN w 123456789 format
    def conform_ssn(n)
      n = n.gsub(/[^0-9]/ ,"")
      if n.length != 9
        return "error"
      else
        return n
      end
    end

    # convert SSN/ITIN to 123-45-6789 format
    def conform_s_s_n(n)
      n = conform_ssn(n)
      n.insert(3,'-').insert(-5,'-')
    end

    # is an SSN number?  (note: excludes ITINs)
    def is_ssn(n)
      n = conform_ssn(n)
      !(n.length != 9 || n[0..2] == '000' || n[3..4] == '00' || n[5..8] == "0000" || n[0..2].to_i.between?(734,749) || n[0..2].to_i > 772)
    end

    # is a ITIN number?
    def is_itin(n)
      n = conform_ssn(n)
      n.length == 9 && n[0] == '9' && n[3].to_i.between?(7,8) && n[5..8] != "0000"
    end

    # convert EIN to 123456789 format
    def conform_ein(n)
      n = n.gsub(/[^0-9]/ ,"")
      if n.length != 9
        return "error"
      else
        return n
      end
    end

    # convert EIN to 12-3456789 format
    def conform_ei_n(n)
      n = conform_ein(n)
      n.insert(2,'-')
    end


    # convert phone number to 123-456-7890 format
    #  *NOTE converts letters to #'s';  removes leading "1"
    def conform_phone(n)
      n = n.upcase.tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ','22233344455566677778889999')
      n = n.gsub(/[^0-9]/ ,"")
      n[0] = "" if n[0] == '1'
      if n.length != 10
        return "error"
      else
        return n.insert(3,'-').insert(-5,'-')
      end
    end





end
