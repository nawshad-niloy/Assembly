#include<iostream>
using namespace std;
struct Process{
int pid;
int arrivalTime;
int burstTime;
int completionTime;
int turnaroundTime;
int waitingTime;
};
void findSJF(Process proc[],int n){
    int remainingTime[n];
    for (int i = 0; i < n; i++)
    {
        remainingTime[i]=proc[i].burstTime;
    }
    int currentTime=0;
    int complete=0;
    int shortest=0;
    int minBurst=9999;
    while (complete<n)
    {
        minBurst=9999;
        for (int i = 0; i < n; i++)
        {
            if(proc[i].arrivalTime<=currentTime && remainingTime[i]<minBurst && remainingTime[i]>0){
                minBurst=remainingTime[i];
                shortest=i;
                

            }
        }
        remainingTime[shortest]--;
        if(remainingTime[shortest]==0){
            complete++;
            proc[shortest].completionTime=currentTime+1;
            proc[shortest].turnaroundTime=proc[shortest].completionTime-proc[shortest].arrivalTime;
            proc[shortest].waitingTime=proc[shortest].turnaroundTime-proc[shortest].burstTime;
        }
        currentTime++;
        
    }
    
    
}
void displayProcessDetails(Process proc[],int n)
{
    int totalTat = 0;
    int totalwt = 0;
    cout<<"Process\tArrivalTime\tBurstTime\tCompletionTime\tTurnaroundTime\tWaitingTime"<<endl;
    for (int i = 0; i < n; i++)
    {
        cout<<proc[i].pid<<"\t\t"<<proc[i].arrivalTime<<"\t\t"<<proc[i].burstTime<<"\t\t"<<proc[i].completionTime<<"\t\t"<<proc[i].turnaroundTime<<"\t\t"<<proc[i].waitingTime<<endl;
         totalTat = totalTat + proc[i].turnaroundTime;
         totalwt = totalwt + proc[i].waitingTime;
    }
    cout<<endl;
    float avrTat = (totalTat/n);
    float avrwt = (totalwt/n);
    cout<<"Average TAT : "<<avrTat<<endl;
    cout<<"Average WT : "<<avrwt<<endl;
}
int main(){
    int n=5;
    Process proc[n];
    cout<<"Enter Process Details(ID,Arrival,Burst)"<<endl;
    for (int i = 0; i < n; i++)
    {
        cout<<"Enter Process "<<i+1<<endl;
        cin>>proc[i].pid>>proc[i].arrivalTime>>proc[i].burstTime;
    }
    findSJF(proc,n);
    displayProcessDetails(proc,n);
    
   

    return 0;
}