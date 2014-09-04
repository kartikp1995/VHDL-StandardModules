////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_four_bit_comb_addsub_behavioral_H
#define H_Work_four_bit_comb_addsub_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_four_bit_comb_addsub_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[15];

    HSim__s1 SA[6];
  char t0;
  char t1;
  char t2;
  char t3;
    Work_four_bit_comb_addsub_behavioral(const char * name);
    ~Work_four_bit_comb_addsub_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_four_bit_comb_addsub_behavioral(const char *name);

#endif
