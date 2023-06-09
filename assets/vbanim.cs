using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class vbanim : MonoBehaviour 
{
    public AudioSource sPlay;
    public GameObject Cube;
    public GameObject vbBtnObj;
    public GameObject vbBtnObj2;



    // Start is called before the first frame update
    void Start()
    {
        vbBtnObj = GameObject.Find("vbtn");
        vbBtnObj2 = GameObject.Find("vbtnn");
        vbBtnObj.GetComponent<VirtualButtonBehaviour>().RegisterOnButtonPressed(OnButtonPressed);
        vbBtnObj2.GetComponent<VirtualButtonBehaviour>().RegisterOnButtonPressed(OnButtonPressed2);
        sPlay.Stop();
    }
    
     public void OnButtonPressed2(VirtualButtonBehaviour vb){
        sPlay.Play();
        Debug.Log("play");
    }
    

    public void OnButtonPressed(VirtualButtonBehaviour vb){
        sPlay.Stop();
        Debug.Log("stop");
    }
    
    // Update is called once per frame
    void Update()
    {
        
    }
}
