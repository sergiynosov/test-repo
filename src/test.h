#ifndef __TEST_H__
#define __TEST_H__

#include <string>
#include <iostream>

class test
{
public:
    test( const std::string& m ="test" ) : msg( m ) {};
    const char* what() const { return msg.c_str(); };
    friend std::ostream& operator<<( std::ostream& os, const test& data ) { return os << data.msg; };
private:
    std::string msg;
};

#endif
