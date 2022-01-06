program Sistemas

	implicit none

	real (kind = 8), allocatable, dimension (:, :)  :: A
	real (kind = 8), allocatable, dimension (:) :: x, r, u, v,b, resultado
	integer N, i, j, k
	
	N = 10
	
	allocate (A(1:N,1:N), x(1:N), r(1:N), resultado(1:N))

!	M = reshape((/2, 4, 3, 4, 5, 1, 6, 6, -2/), (/N, N/))

	u = (/1.0,3.0,5.0,7.0,9.0,11.0,13.0,15.0,17.0,19.0/)
	v = (/2.0,4.0,6.0,8.0,10.0,12.0,14.0,16.0,18.0,20.0/)
	b = (/7.0,19.0,6.0,45.0,24.0,37.0,3.0,41.0,31.0,17.0/)	

do i=1,N
	do j=1,N
		A(i,j)=(1.0/(u(i)-v(j))) 
!		print*,(1.0/((u(i)-v(j))))," "
	end do
end do




!!FFFFFFFFFFFFF
!	open(1,file="matriz")
!                do i=1, N
!                        read(1,*) M(i,1), M(i,2), M(i,3), M(i,4), M(i,5), M(i,6)
!                end do
!        close(1)

  !      open(2, file="vector")
   !             do i=1, N
   !                     read(2,*) r(i)
   !             end do
   !     close(2)

!!FFFFFFFFFFFFFFFFFFF
	
	open(1, file = "salida")
	write(1,*)"MATRIZ A"
	do i = 1, N
		write(1,*) A(i,1), A(i,2), A(i,3),A(i,4), A(i,5), A(i,6), A(i,7), A(i,8),A(i,9), A(i,10)
	end do

	do i = 1, N-1
		do j = i+1, N
			do k = i+1, N
				A(j,k) = A(j,k) - (A(j,i) / A(i,i)) * A(i,k)
			end do
			b(j) = b(j) - (A(j,i) / A(i,i)) * b(i)
			A(j,i) = 0
		end do
	end do

	do i = N, 1, -1
		if (i .eq. N) then
			x(i) = b(i) / A(i,i)
		else if (i .ne. N) then
			do j = i+1, N
				x(i) = x(i) - (A(i,j) * x(j))
			end do
			x(i) = (b(i) + x(i)) / A(i,i)
		end if
	end do


	!do i = 1, N
	!	write(1,*) A(i,1), A(i,2), A(i,3), A(i,4), A(i,5), A(i,6), A(i,7), A(i,8),A(i,9), A(i,10)
	!end do

	write(1,*)"VECTOR B"
	do i = 1, N
                write(1,*) b(i)
        end do

	write(1,*)"resultado"
	do i = 1, N
		write(1,*) x(i)
	end do
	!do i=1,N
        !	print*, A(i,1), A(i,2), A(i,3), A(i,4), A(i,5), A(i,6), A(i,7), A(i,8),A(i,9), A(i,10)
	!end do
	
	!multiplica matriz por vector
	do i=1,N
        	do j=1,N
                	r(i)=r(i)+(A(i,j)*x(j))
        	end do
	end do

	do i=1, N
		resultado(i)=r(i)-b(i)
	end do
	
	write(1,*)"COMPROBAR RESULTADO"
	do i = 1, N
                write(1,*) resultado(i)
        end do
	write(1,*)
	write(1,*)
	close (1)
end program
