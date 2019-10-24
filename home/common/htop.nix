{
  enable = true;
  fields = [ "PID" "USER" "PRIORITY" "NICE" "M_SIZE" "M_RESIDENT" "STATE" "PERCENT_CPU" "PERCENT_MEM" "TIME" "COMM" ];
  sortKey = "PERCENT_CPU";
  treeView = true;
  highlightBaseName = true;
  detailedCpuTime = true;
  cpuCountFromZero = true;
  meters = {
    left = [
      { kind = "LeftCPUs"; mode = 1; }
      { kind = "Blank"; mode = 2; }
      { kind = "Blank"; mode = 2; }
      { kind = "Memory"; mode = 1; }
      { kind = "Swap"; mode = 1; }
     ];
    right = [
      { kind = "RightCPUs"; mode = 1; }
      { kind = "Blank"; mode = 2; }
      { kind = "Tasks"; mode = 2; }
      { kind = "LoadAverage"; mode = 2; }
      { kind = "Uptime"; mode = 2; }
    ];
  };
}