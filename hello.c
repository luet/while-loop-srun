#include <mpi.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

// compile with:
//    mpicc -o hello hello.c

int main(int argc, char **argv){
  int i, j, k,l;
  int rank, size, partner;
  int namelen;
  char name[MPI_MAX_PROCESSOR_NAME];
  char greeting[sizeof(name) + 200];
  // time_t start, end;   // not a primitive datatype
  time_t start;
    
  ///1 MPI initialize
  MPI_Init(&argc, &argv); /* Initialize MPI */
  /* How many processors are they ? */
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  /* Which one am I ? */
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  /* Where am I running */
  MPI_Get_processor_name(name, &namelen);

  ///1 print message to stdout
  time(&start);
  

  /* sprintf(greeting, "Hello world: rank %d of %d running on %s DEI! start: %s\n",
     rank, size, name, ctime(&start)); */
  sprintf(greeting, "Hello world: rank %d of %d running on %s DEI! start: %s\n",
	  rank, size, name, ctime(&start));
  
  ///1 Receive a message from the nodes
  if(rank == 0){
    fputs(greeting, stdout);
    sleep(10);
    
    for(partner=1; partner<size; partner++){
      MPI_Status stat;
      MPI_Recv(greeting, sizeof(greeting), MPI_BYTE, partner, 1, MPI_COMM_WORLD, &stat);
      fputs(greeting, stdout);
      fflush(stdout);

    };


  }
  else{
    sleep(10);
    MPI_Send(greeting, strlen(greeting)+1, MPI_BYTE, 0, 1, MPI_COMM_WORLD);
  }

  ///1 MPI finalize
  MPI_Finalize();
}


      
