! Brendon Kupsch
! Fortran Ceaser Cipher

program CodeCipher
  implicit none
  integer :: shift_val = 10    
  character(3) :: input_str = 'HAL'
  character(3) :: original = ''
  character(3) :: ciphered = ''
  original = input_str

  write(*, '(2a)') 'Original string  = ', trim(original)
  
  call encrypt(input_str, shift_val)
  write(*, '(2a)') 'Encrypt: ', trim(original)//' => '//trim(input_str)
  ciphered = input_str
  
  call decrypt(input_str, shift_val)
  write(*, '(2a)') 'Decrypted: ', trim(ciphered)//' => '//trim(input_str)

  call solve(input_str, original)
  
contains
 
subroutine encrypt(msg, shift)
  character(*), intent(inout) :: msg
  integer :: shift
  integer :: i

  do i = 1, len(msg)
    select case(msg(i:i))
      case ('A':'Z')
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 65 + shift, 26) + 65)
      case ('a':'z')
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 97 + shift, 26) + 97)
    end select
  end do
end subroutine
 
subroutine decrypt(msg, shift)
  character(*), intent(inout) :: msg
  integer :: shift
  integer :: i
 
  do i = 1, len(msg)
    select case(msg(i:i))
      case ('A':'Z')
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 65 - shift, 26) + 65)
      case ('a':'z')
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 97 - shift, 26) + 97)
    end select
  end do
end subroutine

subroutine solve(msg, original)
  character(*), intent(inout) :: msg
  character(*), intent(inout) :: original
  character(4) :: shift_key
  integer :: i
  
  do i = 0, 26
    msg = original
    call encrypt(msg, i)
    write(shift_key, '(I2)') i 
    write(*, '(2a)') 'Key:', trim(shift_key)//' => '//trim(msg)
  end do
end subroutine
 
end program CodeCipher