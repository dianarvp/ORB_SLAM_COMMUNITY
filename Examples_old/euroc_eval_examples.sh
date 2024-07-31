#!/bin/bash
pathDatasetEuroc='EXAMPLE' #Example, it is necesary to change it by the dataset path

# Single Session Example (Pure visual)
echo "Launching MH01 with Stereo sensor"
./Stereo/stereo_euroc_old ../Vocabulary/ORBvoc.txt ./Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_01_easy ./Stereo/EuRoC_TimeStamps/MH01.txt dataset-MH01_stereo
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Stereo sensor"
python ../evaluation/evaluate_ate_scale.py ../evaluation/Ground_truth/EuRoC_left_cam/MH01_GT.txt f_dataset-MH01_stereo.txt --plot MH01_stereo.pdf



# MultiSession Example (Pure visual)
echo "Launching Machine Hall with Stereo sensor"
./Stereo/stereo_euroc_old ../Vocabulary/ORBvoc.txt ./Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_01_easy ./Stereo/EuRoC_TimeStamps/MH01.txt "$pathDatasetEuroc"/MH_02_easy ./Stereo/EuRoC_TimeStamps/MH02.txt "$pathDatasetEuroc"/MH_03_medium ./Stereo/EuRoC_TimeStamps/MH03.txt "$pathDatasetEuroc"/MH_04_difficult ./Stereo/EuRoC_TimeStamps/MH04.txt "$pathDatasetEuroc"/MH_05_difficult ./Stereo/EuRoC_TimeStamps/MH05.txt dataset-MH01_to_MH05_stereo
echo "------------------------------------"
echo "Evaluation of MAchine Hall trajectory with Stereo sensor"
python ../evaluation/evaluate_ate_scale.py ../evaluation/Ground_truth/EuRoC_left_cam/MH_GT.txt f_dataset-MH01_to_MH05_stereo.txt --plot MH01_to_MH05_stereo.pdf


# Single Session Example (Visual-Inertial)
echo "Launching V102 with Monocular-Inertial sensor"
./Monocular-Inertial/mono_inertial_euroc_old ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/V1_02_medium ./Monocular-Inertial/EuRoC_TimeStamps/V102.txt dataset-V102_monoi
echo "------------------------------------"
echo "Evaluation of V102 trajectory with Monocular-Inertial sensor"
python ../evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/V1_02_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-V102_monoi.txt --plot V102_monoi.pdf


# MultiSession Monocular Examples

echo "Launching Vicon Room 2 with Monocular-Inertial sensor"
./Monocular-Inertial/mono_inertial_euroc_old ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/V2_01_easy ./Monocular-Inertial/EuRoC_TimeStamps/V201.txt "$pathDatasetEuroc"/V2_02_medium ./Monocular-Inertial/EuRoC_TimeStamps/V202.txt "$pathDatasetEuroc"/V2_03_difficult ./Monocular-Inertial/EuRoC_TimeStamps/V203.txt dataset-V201_to_V203_monoi
echo "------------------------------------"
echo "Evaluation of Vicon Room 2 trajectory with Stereo sensor"
python ../evaluation/evaluate_ate_scale.py ../evaluation/Ground_truth/EuRoC_imu/V2_GT.txt f_dataset-V201_to_V203_monoi.txt --plot V201_to_V203_monoi.pdf