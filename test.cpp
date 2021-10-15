#include <iostream>
#include <opencv2/highgui.hpp>
using namespace std;
using namespace cv;

int main(int argc, char** argv)
{

    cv::Mat image;image = cv::imread("test.jpg", cv::IMREAD_COLOR);


    if(! image.data)
    {
        std::cout<<"can't open file"<<std::endl;
    }

    cv::namedWindow("nabmba iage", cv::WINDOW_AUTOSIZE);
    cv::imshow("nambe image", image);
    cv::waitKey(0);

    return 0;
}
