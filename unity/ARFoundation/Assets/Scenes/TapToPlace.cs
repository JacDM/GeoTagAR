using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.Experimental.XR;
using System;
using UnityEngine.XR.ARSubsystems;
using TMPro;

public class TapToPlace : MonoBehaviour
{
    public GameObject objectToPlace;
    public GameObject placementIndicator;

    private ARRaycastManager arOrigin;
    private Pose placementPose;
    private bool placementPoseIsValid = false;

    public GameObject tree;
    public GameObject buoy;
    public GameObject chest;

    public TMP_Dropdown dropdown;
    public TextMeshProUGUI text;
    public TextMeshProUGUI treeText;
    public TextMeshProUGUI buoyText;
    public TextMeshProUGUI chestText;

    public int currDropdownIndex = -1;


    void Start()
    {
        //objectToPlace.SetActive(false);
        //objectToPlace = chest;
        text.text = "";
        text = chestText;
        arOrigin = FindObjectOfType<ARRaycastManager>();
    }

    void Update()
    {
        UpdatePlacementPose();
        UpdatePlacementIndicator();
        if(currDropdownIndex != dropdown.value)
        {
            change(dropdown.value);
            currDropdownIndex = dropdown.value;
        }
        Debug.Log("hiiii");
        if (placementPoseIsValid && Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)
        {
            objectToPlace.SetActive(true);
            PlaceObject();
        }
    }

    private void PlaceObject()
    {
        objectToPlace.transform.position = placementPose.position;
        objectToPlace.transform.rotation = placementPose.rotation;
    }

    private void UpdatePlacementIndicator()
    {
        if (placementPoseIsValid)
        {
            placementIndicator.SetActive(true);
            placementIndicator.transform.SetPositionAndRotation(placementPose.position, placementPose.rotation);
        }
        else
        {
            placementIndicator.SetActive(false);
        }
    }

    private void UpdatePlacementPose()
    {
        var screenCenter = Camera.current.ViewportToScreenPoint(new Vector3(0.5f, 0.5f));
        var hits = new List<ARRaycastHit>();
        arOrigin.Raycast(screenCenter, hits, TrackableType.Planes);

        placementPoseIsValid = hits.Count > 0;
        if (placementPoseIsValid)
        {
            placementPose = hits[0].pose;

            var cameraForward = Camera.current.transform.forward;
            var cameraBearing = new Vector3(cameraForward.x, 0, cameraForward.z).normalized;
            placementPose.rotation = Quaternion.LookRotation(cameraBearing);
        }
    }

    //Ouput the new value of the Dropdown into Text

    public void change(int num)
    {
        if(num == 0)
        {
            ChangeModel(chest,chestText);
        }
        else if(num == 1)
        {
            ChangeModel(tree,treeText);
        }
        else if(num == 2)
        {
            ChangeModel(buoy,buoyText);
        }
        Debug.Log(num);
    }
    public void ChangeModel(GameObject nextModel, TextMeshProUGUI nextText)
    {
        nextModel.SetActive(true);
        nextModel.transform.position = objectToPlace.transform.position;
        objectToPlace.SetActive(false);
        objectToPlace = nextModel;
        text = nextText;
        Debug.Log("Changed model");
    }

    public void changeText(String flutterText)
    {
        text.text = flutterText;
    }

}