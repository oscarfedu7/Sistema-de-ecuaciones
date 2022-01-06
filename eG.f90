program eG

	implicit none

	real (kind = 8), allocatable, dimension (:, :)  :: M
	real (kind = 8), allocatable, dimension (:) :: x, r, b,  resultado
	integer N, i, j, k
	
	N = 3

	allocate (M(0:N,0:N), x(0:N), r(0:N), b(1:N), resultado(1:N))

	M = reshape((/2, 4, 3, 4, 5, 1, 6, 6, -2/), (/3, 3/))

	r = (/18, 24, 4/)
	
	open(1, file = "sistema-ecuaciones-resuelto")
	
	
	write(1,*)"Matriz"
	
	do i = 1, N
		write(1,*) M(i,1), M(i,2), M(i,3), r(i)!, M(i,4), M(i,5)
	end do
	write(1,*)
	write(1,*)
	
	do i = 1, N-1
		do j = i+1, N
			do k = i+1, N
				M(j,k) = M(j,k) - (M(j,i) / M(i,i)) * M(i,k)
			end do
			r(j) = r(j) - (M(j,i) / M(i,i)) * r(i)
			M(j,i) = 0
		end do
	end do

	do i = N, 1, -1
		if (i .eq. N) then
			x(i) = r(i) / M(i,i)
		else if (i .ne. N) then
			do j = i+1, N
				x(i) = x(i) - (M(i,j) * x(j))
			end do
			x(i) = (r(i) + x(i)) / M(i,i)
		end if
	end do

	write(1,*)
	write(1,*)
	
	write(1,*)"MATRIZ DIAGONALIZADA"
	do i = 1, N
		write(1,*) M(i,1), M(i,2), M(i,3), r(i)!, M(i,4), M(i,5)
	end do

	write(1,*)
	write(1,*)
	
	write(1,*)"resultado"

	do i = 1, N
		write(1,*) x(i)
	end do
	
	

	!multiplica matriz por vector
	do i=1,N
        	do j=1,N
                	b(i)=b(i)+(M(i,j)*x(j))
        	end do
	end do

	do i=1, N
		resultado(i)=b(i)-r(i)
	end do
	
	write(1,*)
	write(1,*)
	
	write(1,*)"COMPROBAR RESULTADO"
	do i = 1, N
                write(1,*) resultado(i)
        end do
	write(1,*)
	write(1,*)

	close (1)

end program
